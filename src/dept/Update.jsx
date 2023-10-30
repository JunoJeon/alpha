import React from "react";
import { Link } from 'react-router-dom';
import withRouter from "./withRouter.js";

class Update extends React.Component {
	
	constructor() {
		super();
	}
	
	componentDidMount(){
		this.state.dept = this.props.location.state.dept
		console.log(this.state.dept)
		this.forceUpdate();
	}
	
	state = {
		dept: {}
	}
	
	onChange(e) {
		console.log(e.target.name + "=" + e.target.value);
		this.state.dept[e.target.name] = e.target.value;
		this.forceUpdate();
	}
	
	async onSubmit(e) {
		e.preventDefault();
		
		let response = await fetch('/rest/dept', {
			method : 'PUT',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(this.state.dept)
		})
		
		if(response.ok) {
			alert("부서수정 성공")
			this.props.navigate("/rest/dept")
		} else {
			let json = await response.json();
			alert("부서수정 실패" + this.message);
		}
	}
	
	render() {
		return (
			<>
			<h1>부서수정</h1>
			<hr/>
			<Link to="/rest/dept">목록으로 이동</Link>
			<form onSubmit={event => this.onSubmit(event)}>
				<fieldset>
					<legend>deptno</legend>
					<input disabled value = {this.state.dept.deptno}/>
				</fieldset>
				<fieldset>
					<legend>dname</legend>
					<input name="dname" value = {this.state.dept.dname == null ? "" : this.state.dept.dname} required maxLength={35} onChange={event => this.onChange(event)}/>
				</fieldset>
				<fieldset>
					<legend>loc</legend>
					<input name="loc" value = {this.state.dept.loc == null ? "" : this.state.dept.loc}  maxLength={13} onChange={event => this.onChange(event)}/>
				</fieldset>
				<fieldset>
					<input type="submit" value="부서 수정"/>
				</fieldset>
			</form>
			</>
		)
	}
}

export default withRouter(Update); 

//일반적으론 export default Update 까지만하면되는데 라우트기능을 가져오기위해선 witgRouter기능을 임포트하고 감싸준다