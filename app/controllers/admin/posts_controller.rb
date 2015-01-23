class Admin::PostsController < Admin::AdminController
  load_and_authorize_resource class: Admin::PostsController
  inherit_resources
  actions :all, :except => [:show, :index]

  meta_table(:post, [ {key: :id, label: 'Number'},
                      {key: :title, searchable: true},
                      {key: :published, label: 'Shown?', display: false},
                      {key: :content, render_text: "<%= record.content[0..20] %>"},
                      {key: :content_type, render_text: "record.content_type"},
                      :views_count,
                      {key: :hubs, label: 'Categories', render_text: "<%= record.hubs.map{|h| link_to h.title, hub_path(h)}.join(',') %>"},
                      {key: :user, label: "Created By Email"},
                      {key: :actions, render_text: [:show, [:edit, :admin],[:destroy, :admin],"<%= link_to record.title, post_path(record) %>"]}
                    ],
                    {:scope => 'published', per_page_choises: [5, 10, 15], includes: [:hubs, :user]})

  def index
    @table = render_posts_table
  end

  def create
    create!{admin_posts_path}
  end

  private

  def post_params
    params.require(:post).permit!
    #params.require(:post).permit(:user_id, :title, :published, :content, :content_type, :tag_list, :type, {:hub_ids => []}, attachments: Attachment.attribute_names.collect { |att| att.to_sym })
  end
end
