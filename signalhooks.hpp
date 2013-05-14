#include <csignal>
#include <errno.h>
#include <signal.h>
#include <sched.h>

#ifndef PARSE_ERR_SIG
#define PARSE_ERR_SIG SIGUSR1
#endif

/* reuse this guy */
#ifndef NONTERM_ERR_SIG
#define NONTERM_ERR_SIG SIGUSR1
#endif

#ifndef TERM_ERR_SIG
#define TERM_ERR_SIG SIGUSR2
#endif
