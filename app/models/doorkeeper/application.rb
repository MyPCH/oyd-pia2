# == Schema Information
#
# Table name: oauth_applications
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  uid          :string           not null
#  secret       :string           not null
#  redirect_uri :text             not null
#  scopes       :string           default(""), not null
#  identifier   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  owner_id     :integer
#  owner_type   :string
#  config       :text
#  tasks        :text
#
# Indexes
#
#  index_oauth_applications_on_owner_id_and_owner_type  (owner_id,owner_type)
#  index_oauth_applications_on_uid                      (uid) UNIQUE
#

module Doorkeeper
	class Application < ActiveRecord::Base
		has_many :logs, foreign_key: 'plugin_id', dependent: :destroy
		has_many :oyd_views, foreign_key: 'plugin_id', dependent: :destroy
		has_many :oyd_tasks, foreign_key: 'plugin_id', dependent: :destroy
		has_many :oyd_task_templates, foreign_key: 'plugin_id', dependent: :destroy
		has_many :oyd_reports, foreign_key: 'plugin_id', dependent: :destroy
		has_many :oyd_report_templates, foreign_key: 'plugin_id', dependent: :destroy
		has_many :permissions, foreign_key: 'plugin_id', dependent: :destroy
		belongs_to :user, foreign_key: 'owner_id', optional: true
	end
end
