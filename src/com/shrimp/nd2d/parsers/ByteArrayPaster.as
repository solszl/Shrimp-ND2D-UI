package com.shrimp.nd2d.parsers
{
	import com.shrimp.nd2d.assets.AssetParser;
	import com.shrimp.nd2d.constant.AssetType;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	
	public class ByteArrayPaster extends AssetParser
	{
		public function ByteArrayPaster()
		{
			super();
		}
		
		protected override function dispose():void
		{
			m_loader.close();
			m_loader = null;
		}
		
		protected override function parseData():void
		{
			m_loader = new URLLoader();
			m_loader.dataFormat = URLLoaderDataFormat.BINARY;
			m_loader.addEventListener(Event.COMPLETE, loadComplete);
			m_loader.load(new URLRequest(info.url));
		}
		
		private function loadComplete(p_event:Event):void
		{
			parseDone(new ByteArrayAssetData(p_event.target.data));
		}
		
		private var m_loader:URLLoader = null;
		
		
		public static function support(p_type:int):Boolean
		{
			if (AssetType.BYTEARRAY == p_type)
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

import flash.utils.ByteArray;

class ByteArrayAssetData implements IAssetData
{
	public function ByteArrayAssetData(p_data:ByteArray)
	{
		m_data = p_data;
	}
	
	public function get data():*
	{
		return m_data;
	}
	
	public function destroy():void
	{
		m_data.clear();
		m_data = null;
	}
	
	private var m_data:ByteArray = null;
}