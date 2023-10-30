import React from "react";
import { sprintf } from "sprintf-js";
import sleep from "es7-sleep";
import withRouter from "./withRouter";
import { Link } from 'react-router-dom';

class List extends React.Component {
	constructor() {
		super();
		this.init();
		
	}
	
	
	async init() {
		let response = await fetch("/rest/dept");
		let json = await response.json();
		
		console.log(json);
		
		this.state.data = json.data;
		
		this.forceUpdate();
	}
	
	state = {
		data: [],
	}
	
	render() {
		return(
			<>
			<h1>부서목록</h1>
			<hr/>
			<Link to="/rest/dept/insert">추가</Link>
			<table border={1}>
				<thead>
				 <tr>
					<th>deptno</th>
					<th>dname</th>
					<th>loc</th>
					<th>수정</th>
					<th>삭제</th>
				 </tr>
				</thead>
				<tbody>
				{
					this.state.data.map( dept =>
						<tr key={dept.deptno}>
							<td>{dept.deptno}</td>
							<td>{dept.dname}</td>
							<td>{dept.loc}</td>
							<td><Link to="/rest/dept/update" state={{dept: dept}}>수정</Link></td>
							<td><Link to="/rest/dept/delete" state={{dept: dept}}>삭제</Link></td>
						</tr>
					)
				}
				</tbody>
			</table>
			</>
		)
	}
	
}

export default withRouter(List);