package com.shrimp.nd2d.parsers
{
	import com.shrimp.nd2d.assets.AssetParser;
	import com.shrimp.nd2d.constant.AssetType;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ImageDecodingPolicy;
	import flash.system.LoaderContext;
	
	/**
	 * ...
	 * @author mm
	 */
	public class BitmapParser extends AssetParser
	{
		public function BitmapParser() 
		{
			super();
		}
		
		protected override function dispose():void
		{
			m_loader.unload();
			m_loader = null;
		}		
		
		protected override function parseData():void
		{
			m_loader = new Loader();
			m_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadComplete);
			var l_context:LoaderContext = new LoaderContext();
			l_context.imageDecodingPolicy = ImageDecodingPolicy.ON_LOAD;
			m_loader.load(new URLRequest(info.url), l_context);
		}
		
		private function loadComplete(p_event:Event):void
		{
			parseDone(new BitmapAssetData(Bitmap(m_loader.content).bitmapData));
		}
		
		private var m_loader:Loader = null;
		
		public static function support(p_type:int):Boolean
		{
			if (AssetType.BITMAP == p_type)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
	}
}

import com.shrimp.nd2d.assets.IAssetData;

import flash.display.BitmapData;

class BitmapAssetData implements IAssetData
{
	public function BitmapAssetData(p_data:BitmapData)
	{
		m_data = p_data;
	}
	
	public function get data():*
	{
		return m_data;
	}
	
	public function destroy():void
	{
		m_data.dispose();
		m_data = null;
	}
	
	private var m_data:BitmapData = null;
}