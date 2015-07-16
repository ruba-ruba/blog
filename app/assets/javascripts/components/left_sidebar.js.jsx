var LinkToLeftSidebar = React.createClass({
    propTypes: {
      class_name: React.PropTypes.string
    },
    render: function () {
        return (
            <div>
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

    clicked: function(index){
      // The click handler will update the state with
      // the index of the focused menu entry
      this.setState({focused: index});
    },


    render: function () {
        var self = this;
        if(self.state.focused == 'active'){
          style = 'disabled';
          self.state.focused = 'disabled'
        } else {
          style = 'active';
          self.state.focused = 'active'
        }

        return (
            <div className={style} onClick={self.clicked.bind(self, self.state.focused)}>
              LEFT SIDE MENU
            </div>
        );
    }
});