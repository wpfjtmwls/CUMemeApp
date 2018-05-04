from . import *
from flask import jsonify

def to_dict(meme):

    return {'userid': meme.userid, 'category': meme.category, 
    'subcategory':meme.subcategory,'name':meme.name,
    'img_url':meme.img_url, 'description':meme.description}

def to_dict_list(memes):

    json_lst = list()

    for meme in memes:
        json_lst.append(to_dict(meme))
    
    return json_lst

def get_category(category):

	memes = Meme.query.filter_by(category=category).all()

	return to_dict_list(memes)

def get_name(name):

    memes = Meme.query.filter_by(name=name).all()

    return to_dict_list(memes)

def get_subcategory(subcategory):

    memes = Meme.query.filter_by(subcategory=subcategory).all()

    return to_dict_list(memes)

def update_meme(userid, name, new_name, new_description):

    meme = Meme.query.filter_by(userid=userid,name=name).first()
    meme.name = new_name
    meme.description = new_description

    db.session.commit()


def insert_meme(userid, category, subcategory, name, img_url, description):
    
    meme = Meme(userid, category, subcategory, name, img_url, description)
    db.session.add(meme)
    db.session.commit()

def delete_meme(userid, name):

    Meme.query.filter_by(userid=userid,name=name).delete()
    db.session.commit()


