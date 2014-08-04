package com.shrimp.nd2d.ui.core
{
	import de.nulldesign.nd2d.display.Node2D;
	import de.nulldesign.nd2d.display.Sprite2D;
	import de.nulldesign.nd2d.materials.Sprite2DMaterial;
	
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;

	/**
	 *	继承Node2D的UI组件基类
	 * @author Sol
	 *
	 */
	public class Component extends Node2D
	{
		/**	监听列表*/
		protected var _listeners:Array;

		public function Component(parent:Node2D=null, xpos:Number=0, ypos:Number=0)
		{
			super();
			preInit();

			move(xpos, ypos);

			if (parent != null)
			{
				parent.addChild(this);
			}
			initialize();
		}

		protected function preInit():void
		{
			_listeners=[];
		}

		protected function initialize():void
		{
			createChildren();
		}

		protected function createChildren():void
		{

		}

		public function move(xpos:Number, ypos:Number):void
		{
			this.x=xpos;
			this.y=ypos;
		}

		private var _mimicDisplayObject:Boolean;
		/**	
		 * 	<li>模拟传统显示列表</li><br/>
		 * 	<li>注册点在左上角</li>
		 * @param b	是否模拟传统显示列表注册点
		 * 
		 */
		public function set mimicDisplayObject(b:Boolean):void
		{
			if(b)
			{
				pivot=new Point(-this.width >> 1, -this.height >> 1);
			}
			else
			{
				pivot = new Point();
			}
			_mimicDisplayObject = b;
		}
		
		public function get mimicDisplayObject():Boolean
		{
			return _mimicDisplayObject;
		}

		public function setSize(w:Number, h:Number):void
		{
			width=w;
			height=h;
		}
		
		override public function set width(value:Number):void
		{
			_width = value;
			super.width = value;
		}
		
		override public function set height(value:Number):void
		{
			_height = value;
			super.height = value;
		}

		/**复写添加监听的方法，将监听对象，类型， 函数注册到listeners中。方便集中管理，销毁*/
		override public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
			this._listeners.push({type: type, listener: listener, useCapture: useCapture});
		}

		/**复写移除监听方法，将监听的事件移除，并且从listeners中移除*/
		override public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			super.removeEventListener(type, listener, useCapture);
			var delEvent:Object;
			for each (var event:Object in _listeners)
			{
				if (event.type == type && event.listener == listener)
				{
					delEvent=event;
					break;
				}
			}
			if (delEvent)
			{
				_listeners.splice(_listeners.indexOf(delEvent), 1);
			}
		}
		
		/**
		 *	销毁 
		 */		
		override public function dispose():void
		{
			super.dispose();
		}
		
		override public function toString():String
		{
			return getQualifiedClassName(this);
		}

		public function get top():Object
		{
			return _top;
		}

		public function set top(value:Object):void
		{
			_top = value;
		}

		public function get bottom():Object
		{
			return _bottom;
		}

		public function set bottom(value:Object):void
		{
			_bottom = value;
		}

		public function get left():Object
		{
			return _left;
		}

		public function set left(value:Object):void
		{
			_left = value;
		}

		public function get right():Object
		{
			return _right;
		}

		public function set right(value:Object):void
		{
			_right = value;
		}
		
		
		private var _top:Object;
		private var _bottom:Object;
		private var _left:Object;
		private var _right:Object;
	}
}
