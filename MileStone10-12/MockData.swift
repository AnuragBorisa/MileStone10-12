import Foundation

struct MockData {
    static let sampleUser: User = {
        // Create mock friends
        let friend1 = Friend(id: "2", name: "Jane Smith")
        let friend2 = Friend(id: "3", name: "Bob Brown")
        
        // Create a mock user and associate friends
        let user = User(
            id: "1",
            isActive: true,
            name: "John Doe",
            age: 30,
            company: "TechCorp",
            email: "johndoe@techcorp.com",
            address: "123 Tech Street",
            about: "A passionate developer.",
            registered: Date(),
            tags: ["developer", "swift"],
            friends: [friend1, friend2]
        )
        
        return user
    }()
}
