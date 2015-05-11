var Post = React.createClass({
  propTypes: {
    id: React.PropTypes.number,
    title: React.PropTypes.string,
    content: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div>Title: {this.props.title}</div>
        <div dangerouslySetInnerHTML={{__html: this.props.content}}></div>
      </div>
    );
  }
});

var ShortPost = React.createClass({
  propTypes: {
    id: React.PropTypes.number,
    title: React.PropTypes.string,
    link: React.PropTypes.string,
    logo: React.PropTypes.text,
    description: React.PropTypes.string,
    type_title: React.PropTypes.string,
    hubs: React.PropTypes.instanceOf(Hub),
    views_count: React.PropTypes.number
  },

  render: function() {
    return (
      <div className={format_classes(this.props.id, this.props.side)}>
        <div className='logo'><img src={this.props.logo}/></div>
        <div className='title'><a href={this.props.link}>{this.props.title}</a></div>
        <div className='description'>{this.props.description}</div>
        <div className='info'>
          <div className='created'>
            <div className='left'>
              <span className='text'>
                <i className='fi-eye'> {this.props.views_count} </i>
              </span>
              <a href={link_to_discuss_thread(this.props.link)}> count </a>
            </div>
            <div className='right'>
              <span className='text'>
                <i className='fi-clock'></i>
                &nbsp;
                {this.props.created_ago}
              </span>
            </div>
          </div>
          <div className='hubs'>
            <HubTitlePrefix/>
            {this.props.hubs.map(function(hub){
              return <Hub title={hub.title} link={link_to_hub(hub)}/>;
            })}
          </div>
          <a href={this.props.link} className='read_post_link'>{this.props.type_title}</a>
        </div>
        <div className='clearfix'></div>
      </div>
    );
  }
});

var format_classes = function(id, side) {
  return dom_id(id) + ' ' + side
}

var link_to_discuss_thread = function(link){
  return link + '#disqus_thread';
}

var link_to_hub = function(hub){
  return '/categories/' + hub.id + '-' + hub.title;
}

var dom_id = function(id){
  return 'post_' + id;
}