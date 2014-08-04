package com.shrimp.nd2d.ui.container
{
	import com.shrimp.nd2d.ui.core.Component;
	import com.shrimp.nd2d.ui.layout.Layout;
	
	import de.nulldesign.nd2d.display.Node2D;

	/**
	 *
	 */
	[DefaultProperty("children")]
	public class Box extends Component
	{
		private var _layout:Layout;

		public function Box(parent:Node2D=null, xpos:Number=0, ypos:Number=0)
		{
			super(parent, xpos, ypos);
		}
		
		public function set layout(value:Layout):void
		{
			this._layout = value;
		}
		
		public function get layout():Layout
		{
			return this._layout;
		}
	}
}
