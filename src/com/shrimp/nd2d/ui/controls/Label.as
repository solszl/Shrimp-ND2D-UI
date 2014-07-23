package com.shrimp.nd2d.ui.controls
{
	import com.shrimp.nd2d.ui.core.Component;
	
	import de.nulldesign.nd2d.display.Node2D;
	import de.nulldesign.nd2d.display.TextField2D;

	/**
	 *	Label组件 
	 * @author Sol
	 * 
	 */	
	public class Label extends Component
	{
		/**	Label所持有的文本*/
		private var _textField:TextField2D;
		private var _text:String;
		
		/** 
		 *	Label组件
		 * @deprecated 用TextField2D替代Label<br/>
		 * 但是,你要记住一点,每次赋值一个新的text,就会产生一个新的纹理上传到GPU<br/>
		 * 推荐TextField2D呈现静态文字,如果频繁动态变换文本,则推荐BitmapFont2D
		 * @see BitmapFont2D
		 * @see TextField2D
		 */
		public function Label(parent:Node2D=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			_textField = new TextField2D();
			addChild(_textField);
		}

		/**	内容*/
		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

	}
}