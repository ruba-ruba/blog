class Admin::PostsController < Admin::AdminController
  load_and_authorize_resource class: Admin::PostsController
  inherit_resources
  actions :all, :except => [:show, :index]

  meta_table(:posts, [{key: :id, label: 'Number', sortable: true},
                      {key: :logo, label: 'Preview', render_text: "<%= image_tag(record.logo, style:'height: 100px;width:100px;') %>"}, 
                      {key: :title, sortable: true, searchable: true},
                      {key: :published, label: 'Shown?', display: false},
                      {key: :content, render_text: "<%= link_to type_title(record), post_path(record) %>"},
                      {key: :content_type, render_text: "record.content_type"},
                      :views_count,
                      {key: :user, method: :email, label: "Created By Email"},
                      {key: :actions, render_text: [:show, [:edit, :admin],[:destroy, :admin],"<%= link_to record.title, post_path(record) %>"]}
                     ],
                    {:scope => 'published.desc', per_page: 4})

  def index
    @table = render_posts_table
  end

  private

  def post_params
    params.require(:post).permit!
    #params.require(:post).permit(:user_id, :title, :published, :content, :content_type, :tag_list, :type, {:hub_ids => []}, attachments: Attachment.attribute_names.collect { |att| att.to_sym })
  end
end
