import React from "react";
import { Link } from 'react-router-dom';
import withRouter from "./withRouter.js";

class Delete extends React.Component {
	
	componentDidMount(){
		this.state.dept = this.props.location.state.dept
		console.log(this.state.dept)
		this.forceUpdate();
	}
	
	state = {
		dept: {}
	}
	
	async onSubmit(e) {
		e.preventDefault();
		
		let response = await fetch('/rest/dept', {
			method : 'DELETE',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(this.state.dept)
		});
		
		if(response.ok) {
			alert("부서삭제 성공")
			this.props.navigate("/rest/dept")
		} else {
			let json = await response.json();
			alert("부서삭제 실패" + this.message);
		}
	}
	
	render() {
		return (
			<>
			<h1>부서삭제</h1>
			<hr/>
			<Link to="/rest/dept">목록으로 이동</Link>
			<form onSubmit={event => this.onSubmit(event)}>
				<fieldset>
					<legend>deptno</legend>
					<input disabled value = {this.state.dept.deptno}/>
				</fieldset>
				<fieldset>
					<legend>dname</legend>
					<input name="dname" value = {this.state.dept.dname == null ? "" : this.state.dept.dname} disabled/>
				</fieldset>
				<fieldset>
					<legend>loc</legend>
					<input name="loc" value = {this.state.dept.loc == null ? "" : this.state.dept.loc}  disabled/>
				</fieldset>
				<fieldset>
					<input type="submit" value="부서 삭제"/>
				</fieldset>
			</form>
			</>
		)
	}
	
}

export default withRouter(Delete); 

//일반적으론 export default Delete 까지만하면되는데 라우트기능을 가져오기위해선 witgRouter기능을 임포트하고 감싸준다