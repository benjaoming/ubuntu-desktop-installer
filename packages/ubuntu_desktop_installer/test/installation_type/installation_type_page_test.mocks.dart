// Mocks generated by Mockito 5.3.2 from annotations
// in ubuntu_desktop_installer/test/installation_type/installation_type_page_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:ui' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:subiquity_client/subiquity_client.dart' as _i5;
import 'package:ubuntu_desktop_installer/pages/installation_type/installation_type_model.dart'
    as _i3;
import 'package:ubuntu_wizard/utils.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeProductInfo_0 extends _i1.SmartFake implements _i2.ProductInfo {
  _FakeProductInfo_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [InstallationTypeModel].
///
/// See the documentation for Mockito's code generation for more information.
class MockInstallationTypeModel extends _i1.Mock
    implements _i3.InstallationTypeModel {
  MockInstallationTypeModel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ProductInfo get productInfo => (super.noSuchMethod(
        Invocation.getter(#productInfo),
        returnValue: _FakeProductInfo_0(
          this,
          Invocation.getter(#productInfo),
        ),
      ) as _i2.ProductInfo);
  @override
  _i3.InstallationType get installationType => (super.noSuchMethod(
        Invocation.getter(#installationType),
        returnValue: _i3.InstallationType.erase,
      ) as _i3.InstallationType);
  @override
  set installationType(_i3.InstallationType? type) => super.noSuchMethod(
        Invocation.setter(
          #installationType,
          type,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i3.AdvancedFeature get advancedFeature => (super.noSuchMethod(
        Invocation.getter(#advancedFeature),
        returnValue: _i3.AdvancedFeature.none,
      ) as _i3.AdvancedFeature);
  @override
  set advancedFeature(_i3.AdvancedFeature? feature) => super.noSuchMethod(
        Invocation.setter(
          #advancedFeature,
          feature,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get encryption => (super.noSuchMethod(
        Invocation.getter(#encryption),
        returnValue: false,
      ) as bool);
  @override
  set encryption(bool? encryption) => super.noSuchMethod(
        Invocation.setter(
          #encryption,
          encryption,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get hasStorage => (super.noSuchMethod(
        Invocation.getter(#hasStorage),
        returnValue: false,
      ) as bool);
  @override
  bool get canInstallAlongside => (super.noSuchMethod(
        Invocation.getter(#canInstallAlongside),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  bool get isDisposed => (super.noSuchMethod(
        Invocation.getter(#isDisposed),
        returnValue: false,
      ) as bool);
  @override
  _i4.Future<void> init() => (super.noSuchMethod(
        Invocation.method(
          #init,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i5.GuidedStorageTarget? preselectTarget(_i3.InstallationType? type) =>
      (super.noSuchMethod(Invocation.method(
        #preselectTarget,
        [type],
      )) as _i5.GuidedStorageTarget?);
  @override
  _i4.Future<void> save() => (super.noSuchMethod(
        Invocation.method(
          #save,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  _i4.Future<void> resetStorage() => (super.noSuchMethod(
        Invocation.method(
          #resetStorage,
          [],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
  @override
  void addListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListener(_i6.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
