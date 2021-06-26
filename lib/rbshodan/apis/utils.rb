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

            def slurp_stream(path, **params)
                if Async::Task.current?
                    async_slurp_stream(path, **params) do |result|
                        yield result
                    end
                else
                    sync_slurp_stream(path, **params) do |result|
                        yield result
                    end
                end
            end

            def turn_into_query(**params)
                filters = params.reject { |key, _| key == :query }
                filters.each do |key, value|
                    params[:query] << " #{key}:#{value}"
                end

                params.select { |key, _| key == :query }
            end
            