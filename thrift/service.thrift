namespace java concurs_atletism
namespace netstd concurs_atletism


typedef string Timestamp

// MODEL
struct Employee{
    1: i64 id,
    2: string username,
    3: string password
}

struct Child{
    1: i64 id,
    2: string cnp,
    3: string fname,
    4: string lname,
    5: i32 age,
}

struct ConcurentDto{
    1: string id,
    2: string cnp,
    3: string fname,
    4: string lname,
    5: i32 age,
    6: i32 nrOfRaces,
}

struct ProbaDto{
    1:i32 id,
    2:i32 type,
    3:i32 minAge,
    4:i32 maxAge,
    5:i32 competitorsNumber
}

struct Proba{
    1:i64 id,
    2:i32 type,
    3:i32 minAge,
    4:i32 maxAge
}


// EXCEPTIONS
exception CompException{
    1: string message,
}


service Proxy{
    void login(1: Organizator organizator) throws (1: CompException c),
    void logout(1:Organizator organizator) throws (1: CompException c),
    void registerCompetitor(1:Concurent concurent, 2:i32 tipProba1, 3:i32 tipProba2) throws (1: CompException c),
    list<ConcurentDto> getAllCompetitors() throws (1: CompException c),
    list<ProbaDto> getAllRaces() throws (1: CompException c),
    Proba getRaceByProperties(1:i32 type, 2:i32 minAge, 3:i32 maxAge) throws (1: CompException c),
    list<Concurent> getRaceCompetitors(1:i64 rid) throws (1: CompException c),

}


service MainWindowController{
    void update(1:list<ProbaDto> probe, 2:ConcurentDto added),
}