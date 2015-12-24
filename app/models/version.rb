class Version < ActiveRecord::Base
  belongs_to :item, :polymorphic => true
  serialize :object
end
