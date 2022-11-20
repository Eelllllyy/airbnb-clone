# frozen_string_literal: true

class StayQuery < BaseQuery
  SEARCH_PARAMS = %i[name].freeze

  private

  def search(scope, query)
    search_with_ilike_text(scope, query, 'stays', params_list: SEARCH_PARAMS)
  end
end
