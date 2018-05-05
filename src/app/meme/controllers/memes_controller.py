from . import *
from app.meme.dao.memes_dao import get_category, insert_meme, get_name, get_subcategory, update_meme, delete_meme


@meme.route('/')
def index():
	return jsonify("Hello World!")

@meme.route('memes', methods=['GET', 'POST', 'DELETE'])
def memes():
	if request.method == 'GET':

		if 'name' in request.args:
			name = request.args['name']
			db_response = get_name(name)
			return jsonify(db_response)
		if 'category' in request.args:
			category = request.args['category']
			db_response = get_category(category)
			return jsonify(db_response)
		if 'subcategory' in request.args:
			subcategory = request.args['subcategory']
			db_response = get_subcategory(subcategory)
			return jsonify(db_response)



			
	elif request.method == 'POST':

		if 'new_name' in request.args:
			userid = request.args['userid']
			name = request.args['name']
			new_name = request.args['new_name']
			new_description = request.args['new_description']
			db_response = update_meme(userid, name, new_name, new_description)

			return jsonify({"sucess":"true"})

		else:
			userid = request.args['userid']
			category = request.args['category']
			subcategory = request.args['subcategory']
			name = request.args['name']
			img_url = request.args['img_url']
			description = request.args['description']
			db_response = insert_meme(userid, category, subcategory, name, img_url, description)

			return jsonify({"sucess":"true"})

	
	elif request.method == 'DELETE':

		userid = request.args['userid'] 
		name = request.args['name']

		db_response = delete_meme(userid, name)

		return jsonify({"sucess":"true"})


	else: 
		return jsonify("Not Supported Requests")

	