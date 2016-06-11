// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift

import Foundation
import Rswift
import UIKit

struct R: Rswift.Validatable {
  static func validate() throws {
    try intern.validate()
  }
  
  struct file {
    static let podsMetadataPlist = FileResource(bundle: _R.hostingBundle, name: "Pods-metadata", pathExtension: "plist")
    static let podsSettingsMetadataPlist = FileResource(bundle: _R.hostingBundle, name: "Pods-settings-metadata", pathExtension: "plist")
    static let settingsBundle = FileResource(bundle: _R.hostingBundle, name: "Settings", pathExtension: "bundle")
    
    static func podsMetadataPlist(_: Void) -> NSURL? {
      let fileResource = R.file.podsMetadataPlist
      return fileResource.bundle?.URLForResource(fileResource)
    }
    
    static func podsMetadataPlist(_: Void) -> String? {
      let fileResource = R.file.podsMetadataPlist
      return fileResource.bundle?.pathForResource(fileResource)
    }
    
    static func podsSettingsMetadataPlist(_: Void) -> NSURL? {
      let fileResource = R.file.podsSettingsMetadataPlist
      return fileResource.bundle?.URLForResource(fileResource)
    }
    
    static func podsSettingsMetadataPlist(_: Void) -> String? {
      let fileResource = R.file.podsSettingsMetadataPlist
      return fileResource.bundle?.pathForResource(fileResource)
    }
    
    static func settingsBundle(_: Void) -> NSURL? {
      let fileResource = R.file.settingsBundle
      return fileResource.bundle?.URLForResource(fileResource)
    }
    
    static func settingsBundle(_: Void) -> String? {
      let fileResource = R.file.settingsBundle
      return fileResource.bundle?.pathForResource(fileResource)
    }
  }
  
  struct font {
    
  }
  
  struct image {
    static let first = ImageResource(bundle: _R.hostingBundle, name: "first")
    static let launchImage = ImageResource(bundle: _R.hostingBundle, name: "LaunchImage")
    static let second = ImageResource(bundle: _R.hostingBundle, name: "second")
    
    static func first(compatibleWithTraitCollection traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.first, compatibleWithTraitCollection: traitCollection)
    }
    
    static func launchImage(compatibleWithTraitCollection traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.launchImage, compatibleWithTraitCollection: traitCollection)
    }
    
    static func second(compatibleWithTraitCollection traitCollection: UITraitCollection? = nil) -> UIImage? {
      return UIImage(resource: R.image.second, compatibleWithTraitCollection: traitCollection)
    }
  }
  
  private struct intern: Rswift.Validatable {
    static func validate() throws {
      try _R.validate()
    }
  }
  
  struct nib {
    static let eventsListTableViewCell = _R.nib._EventsListTableViewCell()
    static let meetupListCollectionViewCell = _R.nib._MeetupListCollectionViewCell()
    static let meetupListView = _R.nib._MeetupListView()
    static let slideListView = _R.nib._SlideListView()
    static let videosListView = _R.nib._VideosListView()
    
    static func eventsListTableViewCell(_: Void) -> UINib {
      return UINib(resource: R.nib.eventsListTableViewCell)
    }
    
    static func meetupListCollectionViewCell(_: Void) -> UINib {
      return UINib(resource: R.nib.meetupListCollectionViewCell)
    }
    
    static func meetupListView(_: Void) -> UINib {
      return UINib(resource: R.nib.meetupListView)
    }
    
    static func slideListView(_: Void) -> UINib {
      return UINib(resource: R.nib.slideListView)
    }
    
    static func videosListView(_: Void) -> UINib {
      return UINib(resource: R.nib.videosListView)
    }
  }
  
  struct reuseIdentifier {
    static let displayMeetupCell: ReuseIdentifier<MeetupListCollectionViewCell> = ReuseIdentifier(identifier: "displayMeetupCell")
    static let eventsListTableViewCell: ReuseIdentifier<EventsListTableViewCell> = ReuseIdentifier(identifier: "EventsListTableViewCell")
  }
  
  struct segue {
    
  }
  
  struct storyboard {
    static let main = _R.storyboard.main()
    
    static func main(_: Void) -> UIStoryboard {
      return UIStoryboard(resource: R.storyboard.main)
    }
  }
}

struct _R: Rswift.Validatable {
  static let hostingBundle = NSBundle(identifier: "br.com.cocoaheads.CocoaHeads-Apps")
  
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    struct _EventsListTableViewCell: NibResourceType, ReuseIdentifierType {
      typealias ReusableType = EventsListTableViewCell
      
      let bundle = _R.hostingBundle
      let identifier = "EventsListTableViewCell"
      let name = "EventsListTableViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> EventsListTableViewCell? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? EventsListTableViewCell
      }
    }
    
    struct _MeetupListCollectionViewCell: NibResourceType, ReuseIdentifierType {
      typealias ReusableType = MeetupListCollectionViewCell
      
      let bundle = _R.hostingBundle
      let identifier = "displayMeetupCell"
      let name = "MeetupListCollectionViewCell"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> MeetupListCollectionViewCell? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? MeetupListCollectionViewCell
      }
    }
    
    struct _MeetupListView: NibResourceType {
      let bundle = _R.hostingBundle
      let name = "MeetupListView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIView? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? UIView
      }
    }
    
    struct _SlideListView: NibResourceType {
      let bundle = _R.hostingBundle
      let name = "SlideListView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIView? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? UIView
      }
    }
    
    struct _VideosListView: NibResourceType {
      let bundle = _R.hostingBundle
      let name = "VideosListView"
      
      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [NSObject : AnyObject]? = nil) -> UIView? {
        return instantiateWithOwner(ownerOrNil, options: optionsOrNil)[0] as? UIView
      }
    }
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
    }
    
    struct main: StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UITabBarController
      
      let bundle = _R.hostingBundle
      let name = "Main"
      
      static func validate() throws {
        if UIImage(named: "first") == nil { throw ValidationError(description: "[R.swift] Image named 'first' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIImage(named: "second") == nil { throw ValidationError(description: "[R.swift] Image named 'second' is used in storyboard 'Main', but couldn't be loaded.") }
      }
    }
  }
}