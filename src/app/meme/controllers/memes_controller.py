from . import *
from app.meme.dao.memes_dao import get_category, insert_meme, get_name, get_subcategory, update_meme, delete_meme


@meme.route('/')
def index():
	return jsonify("Hello World!")

@meme.route('memes', methods=['GET', 'POST', 'DELETE'])
def memes():
	if request.method == 'GET':

		try:
			if 'name' in request.args:
				name = request.args['name']
				db_response = get_name(name)
			if 'category' in request.args:
				category = request.args['category']
				db_response = get_category(category)
			if 'subcategory' in request.args:
				subcategory = request.args['subcategory']
				db_response = get_subcategory(subcategory)

			return jsonify(db_response)

		except:
			pass
			
	elif request.method == 'POST':

		try:
			if 'new_name' in request.args:
				print ("hi im here")
				userid = request.args['userid']
				name = request.args['name']
				new_name = request.args['new_name']
				new_description = request.args['new_description']
				print ("still here")
				update_meme(userid, name, new_name, new_description)
				print ("am I done?")

			else:
				userid = request.args['userid']
				category = request.args['category']
				subcategory = request.args['subcategory']
				name = request.args['name']
				img_url = request.args['img_url']
				description = request.args['description']
				insert_meme(userid, category, subcategory, name, img_url, description)
		except:
			pass

	
	elif request.method == 'DELETE':

		try:
			userid = request.args['userid'] 
			name = request.args['name']

			delete_meme(userid, name)
		except:
			pass

	else: 
		return jsonify("Not Supported Requests")

	