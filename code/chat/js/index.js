class CommentForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      comment: '',
      author: '' };


    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({
      [event.target.name]: event.target.value });

  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.post({ author: this.state.author, content: this.state.comment });
    this.setState({ comment: '' });
  }

  render() {
    return (
      React.createElement("form", { className: "comments-void__form", onSubmit: this.handleSubmit },
      React.createElement("fieldset", null,
      React.createElement("input", { name: "author", className: "comments-void__form-name", placeholder: "Your name", onChange: this.handleChange, value: this.state.author }),
      React.createElement("textarea", { name: "comment", className: "comments-void__form-comment", placeholder: "Your comment here...", onChange: this.handleChange, value: this.state.comment })),

      React.createElement("button", null, "Send")));


  }}


class Comment extends React.Component {
  render() {
    return React.createElement("li", { className: "comments-void__list-item" }, React.createElement("span", null, this.props.author), " ", this.props.comment);
  }}


class CommentsList extends React.Component {
  render() {
    return (
      React.createElement("ul", { className: "comments-void__list" },
      this.props.comments.map((comment, index) =>
      React.createElement(Comment, { key: index, author: comment.author, comment: comment.content }))));



  }}


class CommentIntoTheVoid extends React.Component {
  constructor(props) {
    super(props);

    let comments = localStorage.getItem('comments') ?
    JSON.parse(localStorage.getItem('comments')) :
    [];

    this.state = { comments: comments };

    this.postComment = this.postComment.bind(this);
  }

  postComment(newComment) {
    let comments = this.state.comments;
    comments.push(newComment);
    this.setState({ comments: comments });
    localStorage.setItem('comments', JSON.stringify(comments));
  }

  render() {
    return (
      React.createElement("div", { className: "comments-void" },
      React.createElement(CommentForm, { post: this.postComment }),
      React.createElement(CommentsList, { comments: this.state.comments })));


  }}


ReactDOM.render(
React.createElement(CommentIntoTheVoid, null),
document.getElementById('root'));