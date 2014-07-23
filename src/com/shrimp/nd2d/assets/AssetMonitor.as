package com.shrimp.nd2d.assets
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.system.System;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	
	/**
	 * 
	 * @author Sol
	 * 
	 */
	public class AssetMonitor 
	{
		public static function gc(p_level:int = 0):void
		{
			var l_pool:Dictionary = AssetPool._pool;
			for (var l_id:String in l_pool)
			{
				var l_asset:Asset = l_pool[l_id];
				if (l_asset.level <= p_level && 0 == l_asset.ref)
				{
					l_asset.life -= s_alpha;
					if (p_level > 0 || l_asset.life < 0)
					{
						delete l_pool[l_id];
						l_asset.destroy();
					}
				}
			}
			
			if (p_level > 0)
			{
				System.gc(); // Force gc especially for mobile platform
			}
		}
		
		public static function start(p_stage:Stage):void
		{
			s_stage = p_stage;
			s_stage.addEventListener(Event.ENTER_FRAME, pulse);
			
			s_time = getTimer();
		}
		
		public static function stop():void
		{
			s_stage.removeEventListener(Event.ENTER_FRAME, pulse);
			s_stage = null;
		}
		
		private static function pulse(p_event:Event):void
		{
			var l_current:int = getTimer();
			s_alpha += (l_current - s_time);
			s_time = l_current;
			
			if (s_alpha > GC_INTERVAL)
			{
				gc(0);
				s_alpha -= GC_INTERVAL;
			}
		}
		
		private static var s_stage:Stage = null;
		private static var s_time:int = 0;
		private static var s_alpha:int = 0;
		
		private static const GC_INTERVAL:Number = 1000;
	}
}