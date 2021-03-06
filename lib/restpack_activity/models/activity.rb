class Activity
  include ActiveModel::Model

  attr_accessor :id, :application_id, :user_id, :title, :content, :tags,
                :latitude, :longitude, :access, :data, :href, :created_at, :updated_at
  validates_presence_of :user_id, :content

  def initialize(params={})
    @tags = []
    @access = []
    super(params)
  end

  def self.get(id)
    response = service.get(id)
    Activity.new(response.result[:activities].first)
  end

  def self.destroy(id)
    service.destroy(id)
    true
  end

  def self.list(params = {})
    response = service.list(params)

    Page.new(response, :activities) do |activity|
      Activity.new(activity)
    end
  end

  def tags_csv=(csv)
    @tags = csv.split(',')
  end

  def tags_csv
    @tags.join(',')
  end

  def access_csv=(csv)
    @access = csv.split(',')
  end

  def access_csv
    @access.join(',')
  end

  def save
    if valid?
      response = new? ? service.create(attributes) : service.update(attributes)

      if response.success?
        #TODO: GJ: update model attributes?
        return true
      else
        response.errors.each do |key, messages|
          messages.each do |message|
            errors.add(key, message)
          end
        end

        return false
      end
    end

    nil
  end

  def new?
    @id.nil?
  end

  def persisted?
    !new?
  end

  def update_attributes(params)
    #TODO: GJ: extract into base class
    #TODO: whitelist updateble params
    @title = params[:title] if params[:title]
    @content = params[:content] if params[:content]
    @latitude = params[:latitude] if params[:latitude]
    @longitude = params[:longitude] if params[:longitude]
    @data = params[:data] if params[:data]
    self.tags_csv = params[:tags_csv] if params[:tags_csv]
    self.access_csv = params[:access_csv] if params[:access_csv]
  end

  def self.service
    klass = "RestPack::Activity::Proxies::#{RestPack::Activity.config.service_type.capitalize}"
    klass.classify.constantize
  end

  def service
    self.class.service
  end

  private

  def attributes
    #TODO: GJ: extract into base class
    #TODO: GJ: only those that have changed
    hash = {
      id: @id,
      application_id: @application_id,
      user_id: @user_id,
      title: @title,
      content: @content,
      tags: @tags.join(','),
      access: @access.join(',')
    }

    hash[:latitude] = @latitude unless @latitude.blank?
    hash[:longitude] = @longitude unless @longitude.blank?
    hash[:data] = @data unless @data.blank?
    hash
  end
end
