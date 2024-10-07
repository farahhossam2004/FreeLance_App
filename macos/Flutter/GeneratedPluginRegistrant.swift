//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< HEAD
import file_selector_macos
=======
import cloud_firestore
import file_selector_macos
import firebase_auth
import firebase_core
>>>>>>> 75d144303f99c9f70e25a053641b616fc6534082
import path_provider_foundation
import rive_common
import url_launcher_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
<<<<<<< HEAD
  FileSelectorPlugin.register(with: registry.registrar(forPlugin: "FileSelectorPlugin"))
=======
  FLTFirebaseFirestorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseFirestorePlugin"))
  FileSelectorPlugin.register(with: registry.registrar(forPlugin: "FileSelectorPlugin"))
  FLTFirebaseAuthPlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseAuthPlugin"))
  FLTFirebaseCorePlugin.register(with: registry.registrar(forPlugin: "FLTFirebaseCorePlugin"))
>>>>>>> 75d144303f99c9f70e25a053641b616fc6534082
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  RivePlugin.register(with: registry.registrar(forPlugin: "RivePlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
}
