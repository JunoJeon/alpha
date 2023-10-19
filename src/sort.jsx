import React from "react"
import ReactDOM from "react-dom/client"
import Alpha from "./util/alpha.js"
import { sprintf } from "sprintf-js"
import sleep from "es7-sleep"
import $ from 'jquery'
import "./css/sort.css"

class Sort extends Alpha {
	
	left = 0;
	top = 0;
	scale = 1;
	degree = 0;

	constructor() {
		super();
		this.init();
	}
	
	init() {
		this.left = 600;
		this.top = 100;
		this.scale = 10;
	}
	
}

class App extends React.Component {
	
	constructor() {
		
		super();
		for (let i=0; i<20; i++) {
			this.state.surface[i]=[];
			for(let j=0; j<40; j++) {
				this.state.surface[i][j] = new Sort();
			}
		}
	}
	
	state = {
		surface : [],
		forCount : 0,
		count : 0,
		ellipse : 0,
		disabled : false,
	}
	
	async sort1() {
		
		let w = $('#surface td:first-child').outerWidth();
		let h = $('#surface td:first-child').outerHeight();
		console.log(`(${w}, ${h})`)
		
		for(let i=0; i<20; i++) {
			for(let j=0; j<40; j++) {
				this.state.surface[i][j].left = w*j;
				this.state.surface[i][j].top = h*i;
				this.state.surface[i][j].scale = 1;
				this.forceUpdate();
				await sleep(10);
			}
		}
		await sleep(2000);
		
		await this.restore1();
	}
	
	async sort2() {
		
		let w = $('#surface td:first-child').outerWidth();
		let h = $('#surface td:first-child').outerHeight();
		console.log(`(${w}, ${h})`)
		
		for(let i=19; i>=0; i--) {
			for(let j=0; j<40; j++) {
				this.state.surface[i][j].left = w*j;
				this.state.surface[i][j].top = h*i;
				this.state.surface[i][j].scale = 1;
				this.forceUpdate();
				await sleep(10);
			}
		}
		await sleep(2000);
		
		await this.restore2();
	}
	
	async sort3() {
		
		let w = $('#surface td:first-child').outerWidth();
		let h = $('#surface td:first-child').outerHeight();
		console.log(`(${w}, ${h})`)
		
		for(let i=19; i>=0; i--) {
			for(let j=39; j>=0; j--) {
				this.state.surface[i][j].left = w*j;
				this.state.surface[i][j].top = h*i;
				this.state.surface[i][j].scale = 1;
				this.forceUpdate();
				await sleep(10);
			}
		}
		await sleep(2000);
		
		await this.restore3();
	}
	
	async restore1() {
	  for (let i = 19; i >= 0; i--) {
	    for (let j = 39; j >= 0; j--) {
	      this.state.surface[i][j].init();
	      this.state.surface[i][j].degree = 360*parseInt(Math.random()*10);
	      this.forceUpdate();
	      await sleep(10); // 모든 요소가 역순으로 초기 상태로 돌아가게 함
	    }
	  }
	  await sleep(2000);
	
	  this.state.disabled = false;
	  this.forceUpdate();
	}

	
	async restore2() {
	  for (let i = 0; i < 20; i++) {
	    for (let j = 39; j >= 0; j--) {
	      this.state.surface[i][j].init();
	      this.state.surface[i][j].degree = 360*parseInt(Math.random()*10);
	      this.forceUpdate();
	      await sleep(10); // 각 요소를 역순으로 초기 상태로 돌아가게 함
	    }
	  }
	  await sleep(2000);
	
	  this.state.disabled = false;
	  this.forceUpdate();
	}
	
	async restore3() {
	  for (let i = 0; i < 20; i++) {
	    for (let j = 0; j < 40; j++) {
	      this.state.surface[i][j].init();
	      this.state.surface[i][j].degree = 360*parseInt(Math.random()*10);
	      this.forceUpdate();
	      await sleep(10); // 각 요소를 역순으로 초기 상태로 돌아가게 함
	    }
	  }
	  await sleep(2000);
	
	  this.state.disabled = false;
	  this.forceUpdate();
	}

	sortNom = 1;
	btnStart_click(e) {
		
		this.state.disabled = true;
		this.forceUpdate();
		
		switch(this.sortNum) {
			case 1 :
				this.sort1();
				break;
			case 2 :
				this.sort2();
				break;
			case 3 :
				this.sort3();
				break;	
		}
		
	}
	
	onSelect(sortNum) {
		this.sortNum = sortNum;
		this.forceUpdate();
	}
	
	render() {
		return(
			<>
			<button disabled={this.state.disabled} onClick={event => this.btnStart_click(event)}>START</button>
			<hr/>
			<input name='sort' type='radio' onChange={() => this.onSelect(1)} checked ={this.sortNum==1}/>
			<input name='sort' type='radio' onChange={() => this.onSelect(2)} checked ={this.sortNum==2}/>
			<input name='sort' type='radio' onChange={() => this.onSelect(3)} checked ={this.sortNum==3}/>
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
													transform:  `scale(${v.scale}) rotate(${v.degree}deg)`,
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