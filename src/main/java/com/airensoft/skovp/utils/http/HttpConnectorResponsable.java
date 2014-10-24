package com.airensoft.skovp.utils.http;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.log4j.Logger;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class HttpConnectorResponsable implements HttpConnectorResponse
{
	private Logger logger = Logger.getLogger(getClass());
	
	private String				responseBody;
	private JsonObject			rootObject;
	private StatusLine			statusLine;
	private String				errorMessage;
	
	private String				requestKey;
	
	public HttpConnectorResponsable()
	{
		this.responseBody = null;
		this.rootObject = null;
		this.statusLine = null;
		this.errorMessage = null;
		
		this.requestKey = null;
	}
	
	@Override
	public void parse(HttpResponse httpResponse) throws IllegalStateException, IOException, RuntimeException
	{
		setResponseBody(httpResponse);
		parse(this.responseBody);
	}
	
	@Override
	public void parse(String jsonString)
	{
		JsonParser parser = new JsonParser();
		JsonElement element = null;
		
		if(jsonString != null)
		{
			try
			{
				element = parser.parse(jsonString);
				this.rootObject = element.getAsJsonObject();
			}
			catch(Exception e)
			{
				logger.info("parse failed: This is not json");
				
				this.rootObject = null;
			}	
		}
	}
	
	/**
	 * <pre>
	 * HttpResponse???�이?��? 초기?�한??
	 * </pre>
	 */
	@Override
	public void clear()
	{
		this.responseBody = null;
		this.rootObject = null;
		this.statusLine = null;
		this.errorMessage = null;
		
		this.requestKey = null;
	}
	
	@Override
	public String getResponseBody()
	{
		return responseBody;
	}

	@Override
	public void setResponseBody(String responseBody)
	{
		this.responseBody = responseBody;
		
		logger.info(toString());
	}
	
	@Override
	public void setResponseBody(HttpResponse httpResponse) throws IllegalStateException, IOException, RuntimeException
	{
		InputStream inputStream;
		HttpEntity httpEntity;
		StringBuffer stringBuffer;
		String readLine;
		
		httpEntity = httpResponse.getEntity();
		
		setStatusLine(httpResponse.getStatusLine());
		
		if(httpEntity != null)
		{
			inputStream = httpEntity.getContent();
			
			try
			{
				stringBuffer = new StringBuffer();
				
				BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, CHARSET));
				
				while((readLine = reader.readLine()) != null)
				{
					stringBuffer.append(readLine);					
				}
				
				reader.close();
				setResponseBody(stringBuffer.toString());
			}
			catch(IOException e)
			{
				throw e;
			}
			catch(RuntimeException e)
			{
				throw e;
			}
			finally
			{
				inputStream.close();
			}
		}
	}
	
	/**
	 * <pre>
	 * http?�신 ??response 결과 Object�?반환?�다
	 * </pre>
	 * 
	 * @return
	 */
	@Override
	public JsonObject getRootObject()
	{
		return rootObject;
	}
	
	@Override
	public void setRootObject(JsonObject rootObject)
	{
		this.rootObject = rootObject;
	}
	
	/**
	 * <pre>
	 * HTTP ?�청 결과 ?�태 코드�?반환?�다
	 * </pre>
	 * @return HTTP ?�청 결과 ?�태 코드
	 */
	@Override
	public StatusLine getStatusLine()
	{
		return statusLine;
	}

	@Override
	public void setStatusLine(StatusLine statusLine)
	{
		this.statusLine = statusLine;
	}	
	
	/**
	 * <pre>
	 * ?�러 메세�?? 반환?�다
	 * </pre>
	 * 
	 * @return ?�러 메세�?
	 */
	@Override
	public String getErrorMessage()
	{
		return errorMessage;
	}
	
	@Override
	public void setErrorMessage(String errorMessage)
	{
		this.errorMessage = errorMessage;
	}
	
	@Override
	public String getRequestKey()
	{
		return requestKey;
	}

	@Override
	public void setRequestKey(String requestKey)
	{
		this.requestKey = requestKey;
	}

	@Override
	public String toString()
	{
		StringBuilder stringBuilder = new StringBuilder();
		
		stringBuilder.append("======== HTTP Response ( ").append(this.requestKey).append(" )  ========\n");
		stringBuilder.append(responseBody);
		
		return stringBuilder.toString();
	}
}
