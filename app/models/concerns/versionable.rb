module Versionable
  extend ActiveSupport::Concern

  included do
    has_many :versions, class_name: "Version", as:  :item

    after_create  :record_create
    before_update :record_update
    before_destroy :record_destroy
  end

  def record_create
    v = self.versions.new
    v.operation = "create"
    v.save
  end

  def record_update
    v = self.versions.new
    v.operation = "update"
    v.object = self.class.find(self.id)# use old record data
    v.save
  end

  def record_destroy
    v = self.versions.new
    v.operation = "destroy"
    v.object = self
    v.save
  end
end
