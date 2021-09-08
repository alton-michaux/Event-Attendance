# frozen_string_literal: true

class EventsMembers < ApplicationRecord
  include ReportsKit::Model
  
  belongs_to :event
  belongs_to :member

  reports_kit do
    aggregation :duration_of_report_data, [:duration, 'EventsMembers.created_at - EventsMembers.updated_at']
    contextual_filter :for_event, ->(relation, context_params) { relation.where(event_id: context_params[:event_id]) }
    dimension :member_id, group: 'COUNT(EvntsMembers.member_id)'
  end
end
