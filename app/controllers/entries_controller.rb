class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show ]

  def index
    @entries = DelegatedType::Entry.all
  end

  def show
  end

  private
    def set_entry
      @entry = DelegatedType::Entry.find(params[:id])
    end
end
