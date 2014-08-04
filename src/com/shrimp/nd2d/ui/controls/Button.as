package com.shrimp.nd2d.ui.controls
{
	import com.shrimp.nd2d.ui.core.Component;
	
	import de.nulldesign.nd2d.display.Node2D;
	import de.nulldesign.nd2d.display.TextField2D;
	
	public class Button extends Component
	{
		
		private var lbl:TextField2D;
		
		//皮肤文件
		private var skin:Image;
		//选中皮肤
		private var selectedSkin:Object;
		//正常皮肤
		private var normalSkin:Object;
		//当前皮肤
		private var currentSkin:Object;
		
		public function Button(parent:Node2D=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
			mouseEnabled=true;
		}
		
		public function get textField():TextField2D
		{
			if(lbl==null)
			{
				lbl = new TextField2D();
			}
			
			return lbl;
		}
		
		public function set label(value:String):void
		{
			if(lbl==null)
			{
				lbl = new TextField2D();
				addChild(lbl);
			}
			
			lbl.text = value;
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			skin = new Image();
			addChild(skin);
		}
		
		public function set skin(value:Object):void
		{
			skin.source = value;
		}
		
		public function set selectedSkin(value:Object):void
		{
			
		}
		
	}
}