// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return Recipe()
    ..author = json['author'] == null
        ? null
        : Author.fromJson(json['author'] as Map<String, dynamic>)
    ..chefNotes = (json['chefNotes'] as List)?.map((e) => e as String)?.toList()
    ..comments = json['comments'] == null
        ? null
        : Comment.fromJson(json['comments'] as Map<String, dynamic>)
    ..cookMethod =
        (json['cookMethod'] as List)?.map((e) => e as String)?.toList()
    ..cookTime = json['cookTime'] as int
    ..createdBy = json['createdBy'] as String
    ..createdDate = json['createdDate'] as String
    ..cuisines = (json['cuisines'] as List)?.map((e) => e as String)?.toList()
    ..description = json['description'] as String
    ..difficultyRating = json['difficultyRating'] as int
    ..dishName = (json['dishName'] as List)?.map((e) => e as String)?.toList()
    ..dishTypes = (json['dishTypes'] as List)?.map((e) => e as String)?.toList()
    ..id = json['id'] as String
    ..ingredients = (json['ingredients'] as List)
        ?.map((e) =>
            e == null ? null : Ingredient.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..instructions = (json['instructions'] as List)
        ?.map((e) =>
            e == null ? null : Instruction.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..isPrivate = json['isPrivate'] as bool
    ..isSponsored = json['isSponsored'] as bool
    ..likesCount = json['likesCount'] as int
    ..modifiedBy = json['modifiedBy'] as String
    ..modifiedDate = json['modifiedDate'] as String
    ..nutritionInfo = json['nutritionInfo'] == null
        ? null
        : NutritionInfo.fromJson(json['nutritionInfo'] as Map<String, dynamic>)
    ..prepTime = json['prepTime'] as int
    ..rating = json['rating'] as int
    ..ratingCount = json['ratingCount'] as int
    ..reviewCount = json['reviewCount'] as int
    ..servingsMax = json['servingsMax'] as int
    ..servinsMin = json['servinsMin'] as int
    ..sourceDetail = json['sourceDetail'] == null
        ? null
        : SourceDetail.fromJson(json['sourceDetail'] as Map<String, dynamic>)
    ..title = json['title'] as String
    ..totalTime = json['totalTime'] as int;
}

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'author': instance.author,
      'chefNotes': instance.chefNotes,
      'comments': instance.comments,
      'cookMethod': instance.cookMethod,
      'cookTime': instance.cookTime,
      'createdBy': instance.createdBy,
      'createdDate': instance.createdDate,
      'cuisines': instance.cuisines,
      'description': instance.description,
      'difficultyRating': instance.difficultyRating,
      'dishName': instance.dishName,
      'dishTypes': instance.dishTypes,
      'id': instance.id,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'isPrivate': instance.isPrivate,
      'isSponsored': instance.isSponsored,
      'likesCount': instance.likesCount,
      'modifiedBy': instance.modifiedBy,
      'modifiedDate': instance.modifiedDate,
      'nutritionInfo': instance.nutritionInfo,
      'prepTime': instance.prepTime,
      'rating': instance.rating,
      'ratingCount': instance.ratingCount,
      'reviewCount': instance.reviewCount,
      'servingsMax': instance.servingsMax,
      'servinsMin': instance.servinsMin,
      'sourceDetail': instance.sourceDetail,
      'title': instance.title,
      'totalTime': instance.totalTime,
    };
