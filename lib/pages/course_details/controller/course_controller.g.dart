// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseDetailControllerHash() =>
    r'71d8ac69a69f2dcb32365ed7cb4e7902c5db5718';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [courseDetailController].
@ProviderFor(courseDetailController)
const courseDetailControllerProvider = CourseDetailControllerFamily();

/// See also [courseDetailController].
class CourseDetailControllerFamily extends Family<AsyncValue<CourseItem?>> {
  /// See also [courseDetailController].
  const CourseDetailControllerFamily();

  /// See also [courseDetailController].
  CourseDetailControllerProvider call({
    required int index,
  }) {
    return CourseDetailControllerProvider(
      index: index,
    );
  }

  @override
  CourseDetailControllerProvider getProviderOverride(
    covariant CourseDetailControllerProvider provider,
  ) {
    return call(
      index: provider.index,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'courseDetailControllerProvider';
}

/// See also [courseDetailController].
class CourseDetailControllerProvider
    extends AutoDisposeFutureProvider<CourseItem?> {
  /// See also [courseDetailController].
  CourseDetailControllerProvider({
    required int index,
  }) : this._internal(
          (ref) => courseDetailController(
            ref as CourseDetailControllerRef,
            index: index,
          ),
          from: courseDetailControllerProvider,
          name: r'courseDetailControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseDetailControllerHash,
          dependencies: CourseDetailControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseDetailControllerFamily._allTransitiveDependencies,
          index: index,
        );

  CourseDetailControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.index,
  }) : super.internal();

  final int index;

  @override
  Override overrideWith(
    FutureOr<CourseItem?> Function(CourseDetailControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CourseDetailControllerProvider._internal(
        (ref) => create(ref as CourseDetailControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        index: index,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CourseItem?> createElement() {
    return _CourseDetailControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseDetailControllerProvider && other.index == index;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, index.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CourseDetailControllerRef on AutoDisposeFutureProviderRef<CourseItem?> {
  /// The parameter `index` of this provider.
  int get index;
}

class _CourseDetailControllerProviderElement
    extends AutoDisposeFutureProviderElement<CourseItem?>
    with CourseDetailControllerRef {
  _CourseDetailControllerProviderElement(super.provider);

  @override
  int get index => (origin as CourseDetailControllerProvider).index;
}

String _$lessonListControllerHash() =>
    r'e12d0b9564cd2e598949cbd888cfa22c22164b56';

/// See also [lessonListController].
@ProviderFor(lessonListController)
const lessonListControllerProvider = LessonListControllerFamily();

/// See also [lessonListController].
class LessonListControllerFamily extends Family<AsyncValue<List<LessonItem>?>> {
  /// See also [lessonListController].
  const LessonListControllerFamily();

  /// See also [lessonListController].
  LessonListControllerProvider call({
    required int courseId,
  }) {
    return LessonListControllerProvider(
      courseId: courseId,
    );
  }

  @override
  LessonListControllerProvider getProviderOverride(
    covariant LessonListControllerProvider provider,
  ) {
    return call(
      courseId: provider.courseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lessonListControllerProvider';
}

/// See also [lessonListController].
class LessonListControllerProvider
    extends AutoDisposeFutureProvider<List<LessonItem>?> {
  /// See also [lessonListController].
  LessonListControllerProvider({
    required int courseId,
  }) : this._internal(
          (ref) => lessonListController(
            ref as LessonListControllerRef,
            courseId: courseId,
          ),
          from: lessonListControllerProvider,
          name: r'lessonListControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lessonListControllerHash,
          dependencies: LessonListControllerFamily._dependencies,
          allTransitiveDependencies:
              LessonListControllerFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  LessonListControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
  }) : super.internal();

  final int courseId;

  @override
  Override overrideWith(
    FutureOr<List<LessonItem>?> Function(LessonListControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LessonListControllerProvider._internal(
        (ref) => create(ref as LessonListControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LessonItem>?> createElement() {
    return _LessonListControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonListControllerProvider && other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LessonListControllerRef
    on AutoDisposeFutureProviderRef<List<LessonItem>?> {
  /// The parameter `courseId` of this provider.
  int get courseId;
}

class _LessonListControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<LessonItem>?>
    with LessonListControllerRef {
  _LessonListControllerProviderElement(super.provider);

  @override
  int get courseId => (origin as LessonListControllerProvider).courseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
