class Uploads < ActiveRecord::Base
  attr_accessible :attachment
  has_attached_file :attachment,   :styles => { :small => "150x150>" }


  validates_attachment :attachment,
                       :content_type => { :content_type => /^image\/(jpeg|png|gif|tiff)$/}

  has_and_belongs_to_many :users

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
        "name" => read_attribute(:upload_file_name),
        "size" => read_attribute(:upload_file_size),
        "url" => upload.url(:original),
        "delete_url" => upload_path(self),
        "delete_type" => "DELETE"
    }
  end

end
