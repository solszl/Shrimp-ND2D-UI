package com.shrimp.nd2d.ui.core
{
	import com.shrimp.nd2d.assets.AssetVisitor;
	import com.shrimp.nd2d.constant.AssetType;
	
	import de.nulldesign.nd2d.display.Node2D;
	import de.nulldesign.nd2d.display.Sprite2D;
	import de.nulldesign.nd2d.materials.texture.Texture2D;
	
	import flash.geom.Point;
	import flash.utils.getQualifiedClassName;

	/**
	 *	继承Node2D的UI组件基类
	 * @author Sol
	 *
	 */
	public class Component extends Sprite2D
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
		}

		public function setSize(w:Number, h:Number):void
		{
			width=w;
			height=h;
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
		
		protected function getTextureByName(name:String):Texture2D
		{
			var visitor:AssetVisitor = new AssetVisitor();
			var tex:Texture2D;
			if (AssetVisitor.has(name, AssetType.TEXTURE))
			{
				tex = visitor.retain(name, AssetType.TEXTURE);
			}
			else
			{ 
				throw new Error("can not find texture by image name:", name);
			}
			
			visitor.destroy();
			visitor = null;
			
			return tex;
		}
	}
}
