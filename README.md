# Future.swift

<img src="https://img.shields.io/travis/luoxiu/future.swift.svg">


`Future.swift` is an implementation of [Futures and promises](https://en.wikipedia.org/wiki/Futures_and_promises) for Swift.

```swift
fetchImage()
	.validate {
		$0.status.isValid()
	}
	.flatMap { 
	   cache($0)
	}
	.tryMap { 
		try ImageDecoder().decode($0.data)
	}
	.yield(on: .main)
	.done { 
		self.imageView = $0
	}
```

## Highlights

- Full featured
- Unmatched performance
- Slick API