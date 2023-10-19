import React from "react"
import ReactDOM from "react-dom/client"
import Alpha from "./util/alpha.js"
import { sprintf } from "sprintf-js"
import sleep from "es7-sleep"
import $ from 'jquery'
import "./css/move.css"
import { delay } from "underscore"

class Move extends Alpha {
	
	left = 0;
	top = 0;
	speedLeft = 0;
	speedTop = 0;
	speedRotate = 0;
	degree = 0;

	constructor() {
		super();
		this.init();
	}
	
	init() {
		this.speedLeft = Math.random()*5;
		this.speedTop = Math.random()*5;
		this.speedRotate = Math.random()*5;
	}
	
}

class App extends React.Component {
	
	constructor() {
		
		super();
		for (let i=0; i<10; i++) {
			this.state.surface[i]=[];
			for(let j=0; j<20; j++) {
				this.state.surface[i][j] = new Move();
			}
		}
	}
	
	state = {
		surface : [],
		disabled : false,
	}
	
	btnStart_click(e) {
		
		this.state.disabled = true;
		this.forceUpdate();
		this.isStop = false;
		this.random();
		
	}
	
	isStop = false;
	btnStop_click(e) {
		this.state.disabled = false;
		this.forceUpdate();
		this.isStop = true;
	}
	
	async random() {
		
		for (;;) {
			let top  = Math.random()*700;
			let left = Math.random()*700;
			
			for (let i=0; i<10; i++) {
				for (let j=0; j<20; j++) {
					this.state.surface[i][j].left = left;
					this.state.surface[i][j].top = top;
					this.state.surface[i][j].degree = 360*parseInt(Math.random()*10);
				}
			}
			this.forceUpdate();

			await sleep(5000);
			
			if(this.isStop) {
				break;
			}
		}
	}
	
	
	render() {
		return(
			<>
			<button disabled={this.state.disabled} onClick = {event => this.btnStart_click(event)}>START</button>
			<button disabled={!this.state.disabled} onClick = {event => this.btnStop_click(event)}>STOP</button>
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
													top:		v.top,
													left: 		v.left,
													transform: `rotate(${v.degree}deg)`,
													transition: `left ${v.speedLeft}s, top ${v.speedTop}s, transform ${v.speedRotate}s`,
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