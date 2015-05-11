var Post = React.createClass({
  propTypes: {
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
    title: React.PropTypes.string,
    description: React.PropTypes.string
  },

  render: function() {
    return (
      <div>
        <div className='logo'><img src={this.props.logo}/></div>
        <div className='title'><a href='#'>{this.props.title}</a></div>
        <div className='description'> {this.props.description}</div>
        <div className='info'>
          <a href='/posts/{this.props.id}'>Read</a>
        </div>
      </div>
    );
  }
});