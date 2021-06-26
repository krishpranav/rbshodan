require_relative 'utils.rb'

module Rbshodan
    module API
        module Utils

            def get(path, **params)
                return sync_get(path, **params) unless Async::Task.current?

                async_get(path, **params)
            end

            def post(path, body: nil, **params)
                return sync_post(path, params: params, body: body) unless Async::Task.current?

                async_post(path, params: params, body: body)
            end
            