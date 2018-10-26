<?php
/*
   GetFolders.php

   Marketo REST API Sample Code
   Copyright (C) 2016 Marketo, Inc.

   This software may be modified and distributed under the terms
   of the MIT license.  See the LICENSE file for details.
*/

class GetForms{
	public function __construct(){

	}

	public function getForms($api_host, $api_token){
		$url = $api_host . "/asset/v1/forms.json?access_token=" . $api_token."&maxReturn=200";

		$ch = curl_init($url);
		curl_setopt($ch,  CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('accept: application/json',));
		$response = curl_exec($ch);
		$response = json_decode($response);

		$data = new stdClass();
		if(isset($response->success)){
			if($response->success) {
				$data->status = 'success';
				$data->forms_list = $response->result;

			} else {
				$data->status = 'failed';
				$data->reason = 'nothing returned from marketo';
			}
		} else {
			$data->status = 'failed';
			$data->reason = 'nothing returned from marketo';
		}

		return $data;
	}



	public function getForm($api_host, $api_token, $id){
		$url = $api_host . "/asset/v1/form/".$id.".json?access_token=" . $api_token;

		$ch = curl_init($url);
		curl_setopt($ch,  CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('accept: application/json',));
		$response = curl_exec($ch);
		$response = json_decode($response);

		$data = new stdClass();
		if(isset($response->success)){
			if($response->success) {
				$data->status = 'success';
				$data->forms_list = $response->result;

			} else {
				$data->status = 'failed';
				$data->reason = 'nothing returned from marketo';
				$data->details = print_r($response, true);
			}
		} else {
			$data->status = 'failed';
			$data->reason = 'nothing returned from marketo';
		}

		return $data;
	}



	public function getFormFields($api_host, $api_token, $id){
		$url = $api_host . "/asset/v1/form/".$id."/fields.json?access_token=" . $api_token;

		$ch = curl_init($url);
		curl_setopt($ch,  CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HTTPHEADER, array('accept: application/json',));
		$response = curl_exec($ch);
		$response = json_decode($response);

		$data = new stdClass();
		if(isset($response->success)){
			if($response->success) {
				$data->status = 'success';
				$data->forms_list = $response->result;

			} else {
				$data->status = 'failed';
				$data->reason = 'nothing returned from marketo';
				$data->details = print_r($response, true);
			}
		} else {
			$data->status = 'failed';
			$data->reason = 'nothing returned from marketo';
		}

		return $data;
	}



}