var APP = {};

var LinkToLeftSidebar = React.createClass({
    propTypes: {
      class_name: React.PropTypes.string
    },

    trigger_sidebar: function() {
      $(APP).trigger('change');
    },


    render: function () {
        return (
            <div onClick={this.trigger_sidebar}>
              <a href='#' className={this.props.class_name}> ||| </a>
            </div>
        );
    }
});

var LeftSidebar = React.createClass({
    propTypes: {},

    getInitialState: function(){
      return { focused: 'disabled' };
    },
    componentDidMount: function(){
      $(APP).on('change', function(e){
        if(this.state.focused == 'active'){
          this.setState({focused: 'disabled'})
        } else {
          this.setState({focused: 'active'})
        }
      }.bind(this));
    },
    componentWillUnmount: function () {
      $(APP).off('change');
    },

    clicked: function(index){
      this.setState({focused: index});
    },

    render: function () {
        var self = this;
        var style = this.state.focused + " left_sidebar";

        return (
            <div className={style} onClick={self.clicked.bind(self, self.state.focused)}>
              LEFT SIDE MENUs
            </div>
        );
    }
});