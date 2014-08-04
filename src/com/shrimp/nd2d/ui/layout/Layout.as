package com.shrimp.nd2d.ui.layout
{
	import com.shrimp.nd2d.ui.core.Component;
	
	import de.nulldesign.nd2d.display.Node2D;
	
	import flash.utils.getQualifiedClassName;

	public class Layout
	{
		public function Layout()
		{
		}
		protected var target:Component;
		
		protected var measureWidth:Number;
		protected var measureHeight:Number;
		
		public function doLayout(target:Component):void
		{
			if (!this.target)
				return;
			
			this.target=target;
			
			var child:Node2D;
			
			var len:int=target.numChildren;
			
//			for (var i:int=0; i < len; i++)
//			{
//				child=target.getChildAt(i) as Component;
//				if (child.mimicDisplayObject)
//				{
//
//				}
//				else
//				{
//
//				}
//			}
			
			for (var i:int=0; i < len; i++)
			{
				child=target.getChildAt(i);
				if (!(child is Component))
				{
					continue;
				}
				var comp:Component=child as Component;
				if (comp.left != null || comp.right != null || comp.top != null || comp.bottom != null)
				{
					if (comp.left != null && comp.right != null)
					{
						comp.width=target.width - int(comp.left) - int(comp.right);
						comp.x=int(comp.left);
					}
					else
					{
						if (comp.left != null)
						{
							comp.x=int(comp.left);
						}
						
						if (comp.right != null)
						{
							comp.x=int(target.width - int(comp.width) - int(comp.right));
						}
					}
					
					if (comp.top != null && comp.right != null)
					{
						comp.height=target.height - int(comp.top) - int(comp.bottom);
						comp.y=int(comp.top);
					}
					else
					{
						if (comp.top != null)
						{
							comp.y=int(comp.top);
						}
						
						if (comp.bottom != null)
						{
							comp.y=target.height - int(comp.height) - int(comp.bottom);
						}
					}
				}
			}
		}
		
		public function toString():String
		{
			return getQualifiedClassName(this);
		}
	}
}