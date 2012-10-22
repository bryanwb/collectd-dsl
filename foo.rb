require './lib/collectd-dsl.rb'

config = Collectd::DSL.parse do
  plugin :GenericJMX do
    m_bean "memory_pool" do
      object_name "java.lang:type=MemoryPool,*"
      instance_prefix "memory_pool-"
      instance_from "name"
      value do
        type "memory"
        table true
        attribute "Usage"
      end
    end
  end
end

#require 'pry'; binding.pry
open('foo.conf', 'w') do |f|
  f.write(config)
end
