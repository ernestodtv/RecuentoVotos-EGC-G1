from rest_framework import serializers
from models import Result, Question, QuestionOption

class ResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = Result
        fields = ('quantity',)
        
class ResultField(serializers.RelatedField):
    def to_representation(self, value):
        return value.quantity
        

class QuestionOptionSerializer(serializers.ModelSerializer):
    result = ResultField(read_only=True)
    class Meta:
        model = QuestionOption
        fields = ('description', 'result')

class QuestionSerializer(serializers.ModelSerializer):
    questionoption_set = QuestionOptionSerializer(many=True)
    class Meta:
        model = Question
        fields = ('title', 'description', 'optional', 'multiple', 'questionoption_set')
        depth = 5 
        
cambio prueba
