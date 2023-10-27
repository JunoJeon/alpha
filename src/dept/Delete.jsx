import React from "react";
import { Link } from 'react-router-dom';
import withRouter from "./withRouter.js";

class Delete extends React.Component {
	
	render() {
		return (
			<>
			<h1>부서삭제</h1>
			<hr/>
			<Link to="/rest/dept">목록으로 이동</Link>
			</>
		)
	}
	
}

export default withRouter(Delete); 

//일반적으론 export default Delete 까지만하면되는데 라우트기능을 가져오기위해선 witgRouter기능을 임포트하고 감싸준다