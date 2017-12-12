
  class Helloworld < Hyperloop::Component

    # param :my_param
    # param param_with_default: "default value"
    # param :param_with_default2, default: "default value" # alternative syntax
    # param :param_with_type, type: Hash
    # param :array_of_hashes, type: [Hash]
    # collect_other_params_as :attributes  # collects all other params into a hash

    # The following are the most common lifecycle call backs,
    # the following are the most common lifecycle call backs# delete any that you are not using.
    # call backs may also reference an instance method i.e. before_mount :my_method

    before_mount do
      # any initialization particularly of state variables goes here.
      # this will execute on server (prerendering) and client.
      @h_list = HList.all
    end

    after_mount do
      # any client only post rendering initialization goes here.
      # i.e. start timers, HTTP requests, and low level jquery operations etc.
    end

    before_update do
      # called whenever a component will be re-rerendered
    end

    before_unmount do
      # cleanup any thing (i.e. timers) before component is destroyed
    end

    def render
      DIV do
        @h_list.all.each do |hmodel|
               # Row(param1: hmodel.text)
              H2 { "input field value will be displayed here" }

          #    "  Test:  #{hmodel.title) "
         end 
         SayHelloTo(name: "John")
        # "Helloworld Todos: #{@h_list.count} "
      end
    end
  end


class SayHelloTo < Hyperloop::Component
  param :name, type: String

  render(DIV) do
    H4 { "Hello #{params.name}!" }
  end
end