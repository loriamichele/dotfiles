#!/usr/bin/env ruby
require 'json'

module DockerHelper
  @@colors = {
    container: 34,
    container_running: 32,
    container_stopped: 31,
    hash: 33,
    image: 34,
    ip: 36,
    image_ubuntu: 202,
    ports: 241,
    tag: 241
  }

  def color(type)
    @@colors[type]
  end

  def image_color(image)
    color_symbol = ('image_' + image.tr('-', '_')).to_sym
    return @@colors[color_symbol] if @@colors[color_symbol]
    @@colors[:image]
  end

  def colorize(text, color)
    color = format('%03d', color)
    "\033[0;#{color}m#{text}\033[0m"
  end

  def longest_by_type(list, type)
    ordered = list.map { |obj| obj[type] }.group_by(&:size)
    return nil if ordered.empty?
    ordered.max.last[0]
  end
end

Container = Struct.new(:name, :hash, :image, :ip, :is_running)
# Display the list of current docker containers
class DockerContainerList
  include DockerHelper

  def initialize(*args)
    @args = args
    @container_list = container_list
  end

  def container_list
    options = [
      'docker',
      'inspect'
    ]
    cList = `docker ps -qa`
    if cList.empty?
      puts 'No docker containers found'
      exit!
    end
    output = `#{options.join(' ') + ' ' + cList.gsub("\n", ' ').squeeze(' ')}`
    containers = []
    containers << Container.new('Name', 'Hash', '[ reg ] Image', 'IP', 'Status')
    json_containers = JSON.parse(output)
    json_containers.each do |container|
      name = container['Name'][1,container['Name'].length]
      hash = container['Id'][0,12]
      image = container['Config']['Image']
      ip = container['NetworkSettings']['IPAddress']
      status = container['State']['Running']

      if image.include? "amazonaws"
        image = "[-ecr-] " + image[image.index('amazonaws.com')+14,image.length]
      elsif
        image = "[-std-] " + image
      end

      containers << Container.new(name, hash, image, ip, status)
    end
    containers.sort_by do |c|
      [c[:is_running] ? 0 : 1, c[:name]]
    end
  end

  def output_name(container)
    if container[:is_running] == 'Status'
      icon = '  '
      color = color(:container_running)
    elsif container[:is_running]
      icon = ' '
      color = color(:container_running)
    else
      icon = 'X '
      color = color(:container_stopped)
    end
    name = container[:name].ljust(longest_name_length)
    colorize("#{icon} #{name}", color)
  end

  def longest_name_length
    @container_list.map { |obj| obj[:name] }.group_by(&:size).max.last[0].length
  end

  def longest_image_length
    @container_list.map { |obj| obj[:image] }.group_by(&:size).max.last[0].length
  end

  def longest_ip_length
    @container_list.map { |obj| obj[:ip] }.group_by(&:size).max.last[0].length
  end

  def output_hash(container)
    colorize(container[:hash], color(:hash))
  end

  def output_ip(container)
    ip = container[:ip].ljust(longest_ip_length)
    colorize(ip, color(:ip))
  end

  def output_image(container)
    image = container[:image].ljust(longest_image_length)
    colorize(image, color(:image))
  end

  def run
    @container_list.each do |container|
      name = output_name(container)
      hash = output_hash(container)
      ip = output_ip(container)
      image = output_image(container)
      puts "#{name} #{image} #{ip} #{hash}"
    end
  end
end
DockerContainerList.new(*ARGV).run
