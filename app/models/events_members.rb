# frozen_string_literal: true

class EventsMembers < ApplicationRecord
  include ReportsKit::Model
  
  belongs_to :event
  belongs_to :member

  reports_kit do
    contextual_filter :for_event, ->(relation, context_params) { relation.where(eventsmembers.event_id: context_params[eventsmembers.event_id]) }
    dimension :member_id, group: 'COUNT(EventsMembers.member_id)'
  end
end
