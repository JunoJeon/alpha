import React from "react"
import ReactDOM from "react-dom/client"
import Alpha from "./util/alpha.js"
import { sprintf } from "sprintf-js"
import sleep from "es7-sleep"
import $ from 'jquery'
import "./css/ping.css"

class Ping extends Alpha {
	
	position = 'relative'
	
	left = 0;
	top = 0;
	
	speed = 0;
	constructor(w, h) {
		super();
		this.w = w;
		this.h = h;
	}
	
	setLine(line) {
		this.line = line;
		this.top = this.line * this.h;
	}
	
	setColumn(column) {
		this.column = column;
		this.left = this.column * this.w;
	}
}

class App extends React.Component {
	
	constructor() {
		
		super();
		let w = $('.collapse td').outerWidth();
		let h = $('.collapse td').outerHeight();
		
		for(let i=0; i<20; i++) {
			this.state.surface[i] = [];
			let speed = Math.random()*50 + 10;
			
			for(let j=0; j<40; j++) {
				let ping = new Ping(w, h);
				ping.speed = speed;
				ping.position = 'absolute';
				ping.setLine(i);
				ping.setColumn(j);
				this.state.surface[i][j] = ping;
			}
		}
	}
	
	state = {
		surface : [],
		disabled : false,
		rowNum : 0,
	}
	
	isStop = false;
	
	btnStart_click(e) {
		this.state.disabled = true;
		this.forceUpdate();
		this.isStop = false;
		for (let i=0; i<20; i++)
			this.pingpong(this.state.surface[i]);
	}
	
	btnStop_click(e) {
		this.state.disabled = false;
		this.forceUpdate();
		this.isStop = true;
	}
	
	async pingpong(body) {
		
		let isRight = true;
		let head = body[body.length-1];
		
		for(;;) {
			
			if(isRight) 
				this.move(body, 2)
			else 
				this.move(body, 4)
			
			await sleep(head.speed);
			
			if(head.column == 100) 
				isRight = false;
			else if(head.column == 0) 
				isRight = true;
			
			if(this.isStop) {
				break;
			}
		}
	}
	
	move(body, direction) {
		for(let i=0; i<body.length-1; i++) {
			body[i].setColumn(body[i+1].column);
			body[i].setLine(body[i+1].line);
		}

		let head = body[body.length-1];
		
		switch(direction) {
			case 1:		//Up
				head.setLine(--head.line);
				break;	
			case 2:		//Right
				head.setColumn(++head.column);
				break;
			case 3:		//Down
				head.setLine(++head.line);
				break;
			case 4:		//Left
				head.setColumn(--head.column);
				break;
		}
		this.forceUpdate();
	}
	
	render() {
		return(
			<>
			<button disabled={this.state.disabled} onClick = {event => this.btnStart_click(event)}>Start</button>
			<button disabled={!this.state.disabled} onClick = {event => this.btnStop_click(event)}>Stop</button>
			<hr/>
			<table id='surface' 
				   className='collapse'
				   onMouseDown={event => event.preventDefault()}
				   onContextMenu={event => event.preventDefault()}
			>
				<tbody>
					{
						this.state.surface.map((row, k) =>
							<tr key={k}>
								{
									row.map((v, k) =>
										<td style={{
													color:		v.fg,
													background:	v.bg,
													position :  v.position,
													left : 		v.left,
													top : 		v.top,
													transition: `left ${v.speed}ms`
													}} 
													key={k}>
													{v.ch} </td>
									)
								}			
							</tr>
						) 
					}
				</tbody>
			</table>
			</>
		)
	}
	
}


let root = ReactDOM.createRoot(document.querySelector("#root"))

root.render(<App/>)