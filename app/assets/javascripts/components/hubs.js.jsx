var Hub = React.createClass({
  propTypes: {
    title: React.PropTypes.string,
    link: React.PropTypes.string
  },

  render: function() {
    return (
      <div className='hub'>
        <a href={this.props.link}>
          <i className='fi-pencil'></i>
          &nbsp;
          {this.props.hub.title}
        </a>
      </div>
    );
  }
});

var HubTitlePrefix = React.createClass({
  render: function () {
    return (
       <div className='hub'>Categories:</div>
    );
  }
});