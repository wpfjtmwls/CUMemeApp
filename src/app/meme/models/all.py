from meme import *

class MemeSchema(ModelSchema):
  class Meta(ModelSchema.Meta):
    model = Meme
