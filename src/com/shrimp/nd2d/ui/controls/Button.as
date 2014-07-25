package com.shrimp.nd2d.ui.controls
{
	import com.shrimp.nd2d.ui.core.Component;
	
	import de.nulldesign.nd2d.display.Node2D;
	import de.nulldesign.nd2d.display.TextField2D;
	
	public class Button extends Component
	{
		
		private var lbl:TextField2D;
		
		public function Button(parent:Node2D=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		override protected function createChildren():void
		{
			
		}
		
		override protected function step(elapsed:Number):void
		{
			
		}
	}
}